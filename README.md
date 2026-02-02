# Seed Lineage Coding Exercise

A Rails 8 application that models and tracks seed genetics across successive generations.

- Every Seed must have exactly two parent Seeds.
- A parent Seed may have many child Seeds.
- No two child Seeds may share the same pair of parents (the parent pair must be unique).

The data model clearly and correctly represent these relationships.

To run the model for the first time:
```
rails db:migrate
rails db:seed
rails console
```

To reset the database and re-run it:
```
rails db:rollback
rails db:migrate
rails db:seed
rails console
```

Example of how to add a new seed in the console:
```
Seed.create!(name: "NewSeed", parent_one_id: 1, parent_two_id: 2)
```
