Users By Average Session Time
===

`Medium` | [Link](https://platform.stratascratch.com/coding/10352-users-by-avg-session-time?code_type=3)

Calculate each user's average session time. A session is defined as the time difference between a page_load and page_exit. For simplicity, assume a user has only 1 session per day and if there are multiple of the same events on that day, consider only the latest page_load and earliest page_exit, with an obvious restriction that load time event should happen before exit time event . Output the user_id and their average session time.

Table `facebook_web_log`:
- `user_id`: bigint.
- `timestamp`: timestamp.
- `action`: text; including scroll_down, scroll_up, page_exit, page_load.

Example:
| user_id | timestamp | action |
| - | - | - |
| 0 | 2024-09-06 08:30:15 | page_load |
| 0 | 2024-09-06 08:30:18 | page_load |
| 0 | 2024-09-06 08:30:40 | scroll_down |
| 0 | 2024-09-06 08:31:40 | page_exit |
| 1 | 2024-09-06 08:40:00 | page_load |
| 1 | 2024-09-06 08:40:10 | scroll_down |

Output:
| user_id | Average_Session_Time (seconds) |
| - | - |
| 0 | 750 |
| 1 | 40 |
