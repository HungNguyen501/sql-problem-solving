Spotify Penetration Analysis
===

`Hard` | [Link](https://platform.stratascratch.com/coding/10369-spotify-penetration-analysis?code_type=3)

<blockquote>

Market penetration is an important metric for understanding Spotify's performance and growth potential in different regions.
You are part of the analytics team at Spotify and are tasked with calculating the active user penetration rate in specific countries.

For this task, 'active_users' are defined based on the  following criterias:
- `last_active_date`: The user must have interacted with Spotify within the last 30 days.
- `sessions`: The user must have engaged with Spotify for at least 5 sessions.
- `listening_hours`: The user must have spent at least 10 hours listening on Spotify.

Based on the condition above, calculate the active 'user_penetration_rate' by using the following formula.<br>
`Active User Penetration Rate = (Number of Active Spotify Users in the Country / Total users in the Country)`

Total Population of the country is based on both active and non-active users.<br>
The output should contain 'country' and 'active_user_penetration_rate' rounded to 2 decimals.<br>
Let's assume the current_day is `2024-01-31`.
</blockquote>

Table `penetration_analysis`:
- user_id: int
- country: varchar
- last_active_date: datetime
- listening_hours: int
- sessions: int

Preview:
| user_id | country | last_active_date | listening_hours | sessions |
| - | - | - | - | - |
| 1 | USA | 2024-01-29 | 87 | 29 |
| 2 | USA | 2024-01-21 | 62 | 20 |
| 3 | Japan | 2024-01-28 | 39 | 11 |
| 4 | USA | 2024-01-04 | 16 | 8 |
| 5 | USA | 2024-01-04 | 73 | 23 |
