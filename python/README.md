The python files in this directory populate the normalized tables with data in order to complete the normalization process.

The `attributor.py` script parses attributes from the `attributes` column that initially existed with businesses. The values are either put directly into the `business`
table, or into one of the multiple "is-a" relationships for a business.

The `friends.py` script parses the `friends_list_str` of users and creates new rows in the `friends_with` table.

The `is_chain.py` script determines if a business name is a chain, and populates the `business_chain` table.

The `located_in.py` script determines if a business is located within a special type of business, including airports, malls, and train stations. The data is populated into the `located_in` table.

The `.sql` scripts in this directory provide a view of create table commands that were used to generate certain tables that these python scripts operate on.
