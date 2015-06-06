// {
//     init: function(elevators, floors) {
//         // Do stuff with the elevators and floors, which are both arrays of objects
//     },
//     update: function(dt, elevators, floors) {
//         // Do more stuff with the elevators and floors
//         // dt is the number of game seconds that passed since the last time update was called
//     }
// }


// init is called when the challenge starts (put in event listeners and logic)
// update is called repeatedly during the challenge



//level 1 completed code:
{
    init: function(elevators, floors) {
        var elevator = elevators[0]; // Let's use the first elevator
        
        // Whenever the elevator is idle (has no more queued destinations) ...
        elevator.on("idle", function() {
            // let's go to all the floors (or did we forget one?)
            elevator.goToFloor(0);
            elevator.goToFloor(1);
            elevator.goToFloor(2);
        });
    },
    update: function(dt, elevators, floors) {
        // We normally don't need to do anything here
    }
}

transported 15 ppl
elapsed time 52 sec
transported/s .291 ppl/sec
avg waiting time 6.1 s
max waiting time 12.3 s
moves 27



elevator1.goToFloor(0);
elevator1.goToFloor(1);
elevator1.goToFloor(2);
elevator1.goToFloor(3);
elevator1.goToFloor(4);  
elevator1.goToFloor(5); 
elevator1.goToFloor(6); 
elevator1.goToFloor(7); 


{
    init: function(elevators, floors) {
        var elevator1 = elevators[0]; // Let's use the first elevator
        var elevator2 = elevators[1];
        var elevator3 = elevators[2];
        var elevator4 = elevators[3];



        
        // Whenever the elevator is idle (has no more queued destinations) ...
        elevator1.on("idle", function() {
            // let's go to all the floors (or did we forget one?)
            elevator1.goToFloor(0);
            elevator1.goToFloor(1);
            elevator1.goToFloor(2);
            elevator1.goToFloor(3);
            elevator1.goToFloor(4);  
            elevator1.goToFloor(5); 
        });
        
        elevator2.on("idle", function() {
            elevator2.goToFloor(5);
            elevator2.goToFloor(4);
            elevator2.goToFloor(3);  
            elevator2.goToFloor(2); 
            elevator2.goToFloor(1); 
            elevator2.goToFloor(0);
        });

        elevator3.on("idle", function() {
            elevator3.goToFloor(0);
            elevator3.goToFloor(1);
            elevator3.goToFloor(2);
            elevator3.goToFloor(3);
            elevator3.goToFloor(4);  
            elevator3.goToFloor(5); 
        });

        elevator4.on("idle", function() {
            elevator4.goToFloor(5);
            elevator4.goToFloor(4);
            elevator4.goToFloor(3);  
            elevator4.goToFloor(2); 
            elevator4.goToFloor(1); 
            elevator4.goToFloor(0);
        });
        
        elevator1.on("floor_button_pressed", function(floorNum) {
            // Maybe tell the elevator to go to that floor?
            elevator1.goToFloor(floorNum, true);
        })
        
        elevator2.on("floor_button_pressed", function(floorNum) {
            // Maybe tell the elevator to go to that floor?
            elevator2.goToFloor(floorNum, true);
        })

        elevator3.on("floor_button_pressed", function(floorNum) {
            // Maybe tell the elevator to go to that floor?
            elevator3.goToFloor(floorNum, true);
        })

        elevator4.on("floor_button_pressed", function(floorNum) {
            // Maybe tell the elevator to go to that floor?
            elevator4.goToFloor(floorNum, true);
        })
        
   
        
        // if we are on the 0 floor and we are idle, go up to each floor
        // if we are on the 4th floor and we are idle, go down to each floor
        // if we are on floor 1, 2, 3 and we are idle, go the direction that the people in the elevator want to go
   
    },
    update: function(dt, elevators, floors) {
        // We normally don't need to do anything here
    }
}


// level 5
{
    init: function(elevators, floors) {
        var elevator1 = elevators[0]; // Let's use the first elevator
        var elevator2 = elevators[1];
        var elevator3 = elevators[2];
        var elevator4 = elevators[3];

        // Whenever the elevator is idle (has no more queued destinations) ...
        elevator1.on("idle", function() {
            // let's go to all the floors (or did we forget one?)
            elevator1.goToFloor(0);
            //elevator1.goToFloor(1);
            elevator1.goToFloor(2);
            //elevator1.goToFloor(3);
            elevator1.goToFloor(4);  
            //elevator1.goToFloor(5); 
        });

        elevator2.on("idle", function() {
            elevator2.goToFloor(5);
            //elevator2.goToFloor(4);
            elevator2.goToFloor(3);  
            //elevator2.goToFloor(2); 
            elevator2.goToFloor(1); 
            elevator2.goToFloor(0);
        });

        elevator3.on("idle", function() {
            elevator3.goToFloor(0);
            elevator3.goToFloor(1);
            //elevator3.goToFloor(2);
            elevator3.goToFloor(3);
            //elevator3.goToFloor(4);  
            elevator3.goToFloor(5); 
        });

        elevator4.on("idle", function() {
            //elevator4.goToFloor(5);
            elevator4.goToFloor(4);
            //elevator4.goToFloor(3);  
            elevator4.goToFloor(2); 
            //elevator4.goToFloor(1); 
            elevator4.goToFloor(0);
        });

        elevator1.on("floor_button_pressed", function(floorNum) {
            // Maybe tell the elevator to go to that floor?
            elevator1.goToFloor(floorNum);
        })

        elevator2.on("floor_button_pressed", function(floorNum) {
            // Maybe tell the elevator to go to that floor?
            elevator2.goToFloor(floorNum);
        })

        elevator3.on("floor_button_pressed", function(floorNum) {
            // Maybe tell the elevator to go to that floor?
            elevator3.goToFloor(floorNum);
        })

        elevator4.on("floor_button_pressed", function(floorNum) {
            // Maybe tell the elevator to go to that floor?
            elevator4.goToFloor(floorNum);
        })



        // if we are on the 0 floor and we are idle, go up to each floor
        // if we are on the 4th floor and we are idle, go down to each floor
        // if we are on floor 1, 2, 3 and we are idle, go the direction that the people in the elevator want to go

    },
        update: function(dt, elevators, floors) {
            // We normally don't need to do anything here
        }
}


// level 6
{
    init: function(elevators, floors) {
        var elevator1 = elevators[0]; // Let's use the first elevator
        var elevator2 = elevators[1];

        // Whenever the elevator is idle (has no more queued destinations) ...
        elevator1.on("idle", function() {
            // let's go to all the floors (or did we forget one?)
            elevator1.goToFloor(0);
            //elevator1.goToFloor(1);
            //elevator1.goToFloor(2);
            //elevator1.goToFloor(3);
        });

        elevator2.on("idle", function() {
            elevator2.goToFloor(3);  
            //elevator2.goToFloor(2); 
            //elevator2.goToFloor(1); 
            //elevator2.goToFloor(0);
        });

        elevator1.on("floor_button_pressed", function(floorNum) {
            // Maybe tell the elevator to go to that floor?
            elevator1.goToFloor(floorNum);
        })

        elevator2.on("floor_button_pressed", function(floorNum) {
            // Maybe tell the elevator to go to that floor?
            elevator2.goToFloor(floorNum);
        })


    },
        update: function(dt, elevators, floors) {
            // We normally don't need to do anything here
        }
}


// level 7
{
    init: function(elevators, floors) {
        var elevator1 = elevators[0]; // Let's use the first elevator
        var elevator2 = elevators[1];
        var elevator3 = elevators[2];

        // Whenever the elevator is idle (has no more queued destinations) ...
        elevator1.on("idle", function() {
            // let's go to all the floors (or did we forget one?)
            elevator1.goToFloor(0);
            //elevator1.goToFloor(1);
            //elevator1.goToFloor(2);
            //elevator1.goToFloor(3);
        });

        elevator2.on("idle", function() {
            elevator2.goToFloor(0);  
            //elevator2.goToFloor(2); 
            //elevator2.goToFloor(1); 
            //elevator2.goToFloor(0);
        });

        elevator3.on("idle", function() {
            elevator3.goToFloor(1);  
            //elevator2.goToFloor(2); 
            //elevator2.goToFloor(1); 
            //elevator2.goToFloor(0);
        });
        
        elevator1.on("floor_button_pressed", function(floorNum) {
            // Maybe tell the elevator to go to that floor?
            elevator1.goToFloor(floorNum);
        })

        elevator2.on("floor_button_pressed", function(floorNum) {
            // Maybe tell the elevator to go to that floor?
            elevator2.goToFloor(floorNum);
        })

        elevator3.on("floor_button_pressed", function(floorNum) {
            // Maybe tell the elevator to go to that floor?
            elevator3.goToFloor(floorNum);
        })

    },
        update: function(dt, elevators, floors) {
            // We normally don't need to do anything here
        }
}



// how to cluster riders?
// is the elevator going up or down?
// are people already in the elevator going to a floor that is adjacent to the floor you want to go to?





{
    init: function(elevators, floors) {
       var elevators = [0,1,2]

       elevators.forEach(function(elevator) {

       		elevator.on("idle", function() {
            // let's go to all the floors (or did we forget one?)
            elevator.goToFloor(0);
            elevator.goToFloor(1);
            elevator.goToFloor(2);
        	});

       		elevator.on("floor_button_pressed", function(floorNum) {
            // Maybe tell the elevator to go to that floor?
            elevator.goToFloor(floorNum);
        	})

       });

    },
        update: function(dt, elevators, floors) {
            // We normally don't need to do anything here
        }
}











//////////////////////////////////////////////////////////





{
  init: function(elevators, floors) {
    var downQueue = [];
    var upQueue = [];
    var idleElevators = []
    var topFloor = floors.length - 1;

    // go to the floor that a person inside the elevator, and set the status of the elevator to either 'going up' or 'going down'
    var goToAndSetIndicator = function(elevator, floorNum) {
      if (floorNum < elevator.currentFloor()) {
        elevator.goingDownIndicator(true);
        elevator.goingUpIndicator(false);
      } else {
        elevator.goingUpIndicator(true);
        elevator.goingDownIndicator(false);
      }
      elevator.goToFloor(floorNum);
    }

    // 
    var callElevator = function(queue, floorNum) {
      // if there is an idle elevator, wake it up
        if (idleElevators.length > 0) {
          elevator = idleElevators.shift();
          goToAndSetIndicator(elevator, floorNum);
        } else {
          // otherwise add it to the corresponding queue and wait for an elevator to pass
          if (queue.indexOf(floorNum) < 0) queue.push(floorNum);
          queue = downQueue.sort();
        }
    }

    // iterate through each of the elevators and listen for events
    _.each(elevators, function(elevator) {

    	// if an elevator is idle, check to see if there is anyone waiting in the queue. go to the floor that is first in the queue and set the elevator indicators to 'up' or 'down'
      elevator.on("idle", function() {
        // see if there's anyone waiting
        if (upQueue.length + downQueue.length > 0) {
          // if we were going up, go to the highest floor with a person waiting
          // otherwise, go to the lowest floor with a person waiting
          if (elevator.goingUpIndicator()) {
            floorNum = (downQueue.length > 0 ? downQueue.pop() : upQueue.pop())
          } else {
            floorNum = (upQueue.length > 0 ? upQueue.shift() : downQueue.shift())
          }
          goToAndSetIndicator(elevator, floorNum);
        } else {
          // if nobody was waiting, record that this elevator is idle, so it can be woken up later
          idleElevators.push(elevator);
          elevator.goingDownIndicator(false);
          elevator.goingUpIndicator(false);
        }
      });

      // when somebody inside the elevator pushes a button to go to a new floor:
      elevator.on("floor_button_pressed", function(floorNum) {
        // add the new floor to the queue if it wasn't already requested
        if (elevator.destinationQueue.indexOf(floorNum) < 0 ) {
          elevator.destinationQueue.push(floorNum);
          // sort to make sure we visit floors in order
          elevator.destinationQueue = elevator.destinationQueue.sort();
          if (elevator.goingDownIndicator()) {
            elevator.destinationQueue = elevator.destinationQueue.reverse();
          }
          // apply the changes
          elevator.checkDestinationQueue();
        }
      });

      elevator.on("stopped_at_floor", function(floorNum) {
          if (floorNum == 0) {
            // start moving up once we reach the bottom
            elevator.goingDownIndicator(false);
            elevator.goingUpIndicator(true);
          } else if (floorNum == topFloor) {
            // start moving down once we reach the top
            elevator.goingUpIndicator(false);
            elevator.goingDownIndicator(true);
          }
          else if (elevator.destinationQueue.length == 0) {
            // if this was our final stop, pick up anybody here
            // if we end up idling, then these will both get set to false
            elevator.goingUpIndicator(true);
            elevator.goingDownIndicator(true);
          }
          // remove this floor from the corresponding queue if we picked someone up
          if (elevator.goingUpIndicator()) {
            index = upQueue.indexOf(floorNum);
            if (index >= 0) upQueue.splice(index, 1);
          } else if (elevator.goingDownIndicator()) {
            index = downQueue.indexOf(floorNum);
            if (index >= 0) downQueue.splice(index, 1);
          }
      });

      elevator.on("passing_floor", function(floorNum, direction) {
        // check if there is someone here who wants to go our direction
        queue = direction == "up" ? upQueue : downQueue;
        index = queue.indexOf(floorNum);
        if (index >= 0 && elevator.loadFactor() < 0.7) {
          // if yes, and we have room, stop for them
          elevator.goToFloor(floorNum, true);
        }
      });
    });

    _.each(floors, function(floor) {
    	// when someone on a floor pushes the up button, pass in the upQue and the number of the floor to call an elevator
      floor.on("up_button_pressed", function() {
        callElevator(upQueue, floor.floorNum());
      });

      floor.on("down_button_pressed", function() {
        callElevator(downQueue, floor.floorNum());
      });
    });

  },
  update: function(dt, elevators, floors) {
    // We normally don't need to do anything here
  }
}




///////////

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
                // otherwise add it to the corresponding queue and wait for an elevator to pass

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