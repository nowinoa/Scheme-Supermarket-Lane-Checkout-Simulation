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

## Recent Additions
Lately, the file F6 has been added to introduce more functionalities:

- **F6.1.i:** `all-cust-wait_lst` – Returns a list of lists of customer IDs waiting in each lane's queue.
- **F6.1.ii:** `most-crowded` – Returns the lane with the most customers.
- **F6.2.i:** `event-params-lst` – Maps events to return a list of customer and lane IDs as pairs.
- **F6.2.ii:** `is-sorted?` – Checks if a list of events is sorted.
- **Helper Function:** `sort-event` – Sorts events by time and customer ID when time is tied.
- **Helper Function:** `calculate-total-customers` – Calculates the total number of customers in a lane, including those being processed at the till.

## Installation:

1. **Install Racket**:
   - If you don't have Racket installed, go to [https://racket-lang.org/](https://racket-lang.org/) and download it.

2. **Clone or Download the Project**:
   - To clone the project using Git, run the following command in your terminal:
     ```bash
     git clone https://github.com/nowinoa/Scheme-Supermarket-Lane-Checkout-Simulation.git
     ```
   - Alternatively, you can download the project as a ZIP file from the repository's page and extract it.

## Usage
1. **Open the project in DrRacket**:
   - After downloading or cloning the project, open it in DrRacket.

2. **Run the Simulation**:
   - To start the simulation, simply click the **Run** button in DrRacket while `sim-sim.rkt` is the active file. This will:
     - Set up the lanes and events.
     - Start processing the events in the event queue.
     - Output the simulation logs to the console, showing events and lane statuses.

## Credits
This project was created by <a href="https://github.com/nowinoa">Ainhoa Prada</a> under the supervision of the <a href="https://www.gre.ac.uk/">University of Greenwich</a>. 

## License
This project is under MIT license
        
## Questions
For any questions or issues feel free to contact me at: apt.code14@gmail.com

To explore more about my projects visit my profile :point_right: <a href="https://github.com/nowinoa">:computer:</a>

© 2024 Ainhoa Prada. Confidential and Proprietary. All Rights Reserved.
