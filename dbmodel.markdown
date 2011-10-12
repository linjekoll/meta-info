# Databasmodell för Linjekoll

## stops
- sid: string
- provider_id: int
- coordinate: text [JSON]
- name: string

## lines
- lid: string
- provider_id: int

## lines_stops
- line_id: int
- stop_id: int
- order: int

## providers
- name: string

## traveltimes
- origin_id: int
- destination_id: int
- line_id: int
- time: int

## users
- email: string
- password_salt: string
- password_hash: string
- name: string
- role_id: int

## lines_users
- user_id: int
- line_id: int

## stops_user
- user_id: int
- stop_id: int

## roles
- name: string