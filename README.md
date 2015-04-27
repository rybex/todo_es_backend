## Setup

Prepare DB:

```
cp config/database.yml.sample config/database.yml
rake db:setup
```

## Run it

```
rails s
```

## JSON test

```
# Method:   POST
# Endpoint: http://localhost:3000/todo_write/create_list
# Headers:  Content-Type: application/json
# Body:
    {"title": "test"}
```

```
# Method:   POST
# Endpoint: http://localhost:3000/todo_write/add_todo_item
# Headers:  Content-Type: application/json
# Body:
    {"todo_list_id": "#{proper_list_id}", "type": "test", "title": "I have to do something with ES"}
```

```
# Method:   DELETE
# Endpoint: http://localhost:3000/todo_write/remove_list
# Headers:  Content-Type: application/json
# Body:
    {"title": "test"}
```

```
# Method:   DELETE
# Endpoint: http://localhost:3000/todo_write/remove_todo_item
# Headers:  Content-Type: application/json
# Body:
    {"todo_list_id": "#{proper_list_id}", "item_id": "#{proper_item_id}"}
```

```
# Method:   GET
# Endpoint: http://localhost:3000/todo_read/list?id=#{proper_list_id}
# Headers:  Content-Type: application/json
```

