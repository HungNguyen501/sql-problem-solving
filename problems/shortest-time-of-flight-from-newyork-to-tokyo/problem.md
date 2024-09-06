Codility - Shortest time of the fight from New York to Tokyo
===

You are given two tables, `flights` and `airports`, with the following structure:

- `flights`:

| Field | Type |
| - | - |
| origin_port_code | char(3) NOT NULL |
| destination_port_code | char(3) NOT NULL |
| departure_time | timestamp NOT NULL |
| arrival_time | timestamp NOT NULL |

- `airports`:

| Field | Type |
| - | - |
| city_name | varchar(17) NOT NULL |
| port_code | char(3) NOT NULL |

Each row in the table `flights` contains information about a flight.<br>
Each row in the table `airports` contains information about an airport: the city name (`city_name`) and the port code (`port_code`). Each port_code is assigned to at most one airport.<br>

A passenger wants to travel from New York to Tokyo in the shortest possible time. The passenger can start at any airport in New York and must finish their journey at any airport in Tokyo. They can change planes at most once. A plane change is possible if the first flight ends no later than the start time of the second flight. Note that it is possible to change planes if the end_time of the first flight is equal to the start_time of the second flight. The second flight must start from the airport at which the first flight ended.

Write an SQL query that finds the shortest time in which this journey can occur. Return the difference between the time of departure from New York and the time of arrival in Tokyo in minutes. If such a journey is impossible, return NULL.

