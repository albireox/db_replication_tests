# Notes

- Replication seems to work fine for `INSERT`, `UPDATE`, and `DELETE` operations as long as the tables have primary keys.
- If a table has a primary key defined as `SERIAL`, replication works fine, but there may be conflicts as the replication doesn't update the sequence current value. Probably best to avoid using serials or make sure to update the sequence in the code before inserting new rows.
