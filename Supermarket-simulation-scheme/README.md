# Scheme Supermarket Lane Checkout

The Supermarket Lane Checkout Simulation models a queue management system where customers are generated at regular intervals and assigned to the least crowded lane. The first customer in the lane is processed during checkout, and once completed, customers leave the lane and exit the store. The simulation uses event-driven programming to manage customer flow and lane status in real-time, logging events and updating lane statuses to reflect the ongoing changes.

## Files in the Project

1. **`sim-lane.rkt`**: 
   - Defines the structure of a lane and provides functions to manage customers in the lanes, such as checking if the lane is busy, adding a customer to the lane, and popping customers from the lane.

2. **`sim-lane-list.rkt`**: 
   - Manages a list of lanes and provides utilities like checking if all elements in the list are lanes and finding the least crowded lane based on the number of customers.

3. **`sim-event.rkt`**: 
   - Defines the structure of events, including event types (enter, checkout, leave), and provides functions for creating, accessing, and validating events. The module includes utilities for working with event data, such as retrieving the event type, time, and associated user and lane IDs.

4. **`sim-event-queue.rkt`**: 
   - Implements a priority queue for managing events, sorting them based on their scheduled time. It also provides a function to add events to the queue in the correct order.

5. **`sim-utils.rkt`**: 
   - Contains utility functions for converting time from seconds to hours, minutes, and seconds, as well as a logging function that outputs the current simulation state, including the time of the event and the status of each lane.

6. **`sim-sim.rkt`**: 
   - The main simulation file. It ties together all the components, initializing lanes, events, and the event queue. The simulation processes events in order, updates the lane statuses, and generates logs of the simulation’s progress.











## Installation:

1. **Install Racket**:
   - If you don't have Racket installed, go to [https://racket-lang.org/](https://racket-lang.org/) and download it.

2. **Clone or Download the Project**:
   - To clone the project using Git, run the following command in your terminal:
     ```bash
     git clone <repository-url>
     ```
   - Alternatively, you can download the project as a ZIP file from the repository's page and extract it.

3. **Open the project in DrRacket**:
   - After downloading or cloning the project, open it in DrRacket.

4. **Run the Simulation**:
   - To start the simulation, simply click the **Run** button in DrRacket while `sim-sim.rkt` is the active file. This will:
     - Set up the lanes and events.
     - Start processing the events in the event queue.
     - Output the simulation logs to the console, showing events and lane statuses.
