{
    init: function(elevators, floors) {
        var elevatorCount = elevators.length;
        var floorCount = floors.length;
        var downQueue = [];
        var upQueue = [];
        var idleElevatorCount = []
       
        // function to go a requested floor
        var goToFloorRequested = function(floorNum, elevator) {
            // set indicators based on where the elevator is relative to where its going
            if (elevator.currentFloor() > floorNum) {
                elevator.goingDownIndicator(true);
                elevator.goingUpIndicator(false);
            } else {
                elevator.goingUpIndicator(true);
                elevator.goingDownIndicator(false);
            };
            elevator.goToFloor(floorNum);
        };
        
        // function to get an elevator to use
        var callElevatorToFloor = function(queue, floorNum) {
            // if there is an idle elevator, use it for the request
            if (idleElevatorCount.length > 0) {
                elevator = idleElevatorCount.shift();
                goToFloorRequested(floorNum, elevator);
            } else {
                // otherwise push that floorNum to the corresponding queue and wait for an elevator going that direction
      			if (queue.indexOf(floorNum) < 0) {
      				queue.push(floorNum);
      			}
      			queue = downQueue.sort();
            };
        };
        
        // for every single elevator:
        for (var i = 0; i < elevatorCount; i++) {
            
            elevators[i].on("idle", function() { 
                var elevator = this;
                
                if (upQueue.length + downQueue.length === 0) {
                 
		          if (elevator.goingUpIndicator()) {

                	// if we were going up, go to the highest floor with a person waiting
		            if (downQueue.length > 0) {
		            	floorNum = downQueue.pop();
		            } else {
		            	floorNum = upQueue.pop();
		            };

		          } else {
		            // shift takes the first index from an array
		            // pop takes the last index from an array

		          	// otherwise, go to the lowest floor with a person waiting
		            if (upQueue.length > 0) {
		            	floorNum = upQueue.shift();
		            } else {
		            	floorNum = downQueue.shift();
		            };
		          };
                    
                } else {
                    // if there's nobody waiting for an elevator, set the elevator to idle
                    idleElevatorCount.push(elevator);
                    elevator.goingDownIndicator(false);
                    elevator.goingUpIndicator(false);
                };
            });
            
            // when someone goes into an elevator and presses a floor to go to, send the right elevator to that floor
            elevators[i].on("floor_button_pressed", function(floorNum) {
                var elevator = this;  

                // add the new floor to the queue if it wasn't already requested
		        if (elevator.destinationQueue.indexOf(floorNum) < 0 ) {
		          elevator.destinationQueue.push(floorNum);
		          // sort to make sure we visit floors in order
		          elevator.destinationQueue = elevator.destinationQueue.sort();
		          if (elevator.goingDownIndicator()) {
		            elevator.destinationQueue = elevator.destinationQueue.reverse();
		          };
		          // apply the changes
		          elevator.checkDestinationQueue();
		        };

            });  
            
            elevators[i].on("stopped_at_floor", function(floorNum) {
                var elevator = this;
                // elevator.goingDownIndicator(true);
                // elevator.goingUpIndicator(true);
         
                if (floorNum == 0) {
    	            // start moving up once we reach the bottom
    	            elevator.goingDownIndicator(false);
    	            elevator.goingUpIndicator(true);
    	          } else if (floorNum == floorCount) {
    	            // start moving down once we reach the top
    	            elevator.goingUpIndicator(false);
    	            elevator.goingDownIndicator(true);
    	          } else if (elevator.destinationQueue.length == 0) {
    	            // if this was our final stop, pick up anybody here
    	            // if the elevator ends up being idle, then these will both get set to false
    	            elevator.goingUpIndicator(true);
    	            elevator.goingDownIndicator(true);
    	          };
    	          // remove this floor from the corresponding queue if we picked someone up
    	          if (elevator.goingUpIndicator()) {
    	            index = upQueue.indexOf(floorNum);
    	            if (index >= 0) {
    	            	upQueue.splice(index, 1);
    	            };
    	          } else if (elevator.goingDownIndicator()) {
    	            index = downQueue.indexOf(floorNum);
    	            if (index >= 0) {
    	            	downQueue.splice(index, 1);
    	            };
    	        };

            }); 
            
            elevators[i].on("passing_floor", function(floorNum, direction) {

		        var elevator = this;

		        if (direction == "up") {
		        	queue = upQueue;
		        } else {
		        	queue = downQueue;
		        };

		        // check if they're going to a floor already in the queue
		        index = queue.indexOf(floorNum);
		        
		        if (index >= 0 && elevator.loadFactor() < 0.8) {
		            // if yes, and we have room, stop for them
		            elevator.goingUpIndicator(true);
                    elevator.goingDownIndicator(true);
		          
		            elevator.goToFloor(floorNum, true);
		        };
            }); 

        };
        
        // for every single floor
        for (var j = 0; j < floors.length; j++) {
            // floor object properties
            //floor.floorNum(); // gets the floor number of the floor object
            
            // when someone presses the up or down button at a floor, call an elevator to that floor
            floors[j].on("up_button_pressed", function() {
              var floor = this;
              callElevatorToFloor(upQueue, floor.floorNum());
            });
            
            floors[j].on("down_button_pressed", function() {
               var floor = this;
               callElevatorToFloor(downQueue, floor.floorNum());
            });

        };

    },
        update: function(dt, elevators, floors) {
            // We normally don't need to do anything here
        }
}