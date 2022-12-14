table "comments" {
  schema = schema.public
  column "id" {
    null = false
    type = integer
  }
  column "user" {
    null = false
    type = character_varying(25)
  }
  column "comment" {
    null = false
    type = text
  }
  column "video_id" {
    null = false
    type = text
  }
  primary_key {
    columns = [column.id]
  }
  foreign_key "video_fk" {
    columns     = [column.video_id]
    ref_columns = [table.videos.column.id]
    on_update   = NO_ACTION
    on_delete   = NO_ACTION
  }
}
table "videos" {
  schema = schema.public
  column "id" {
    null = false
    type = text
  }
  column "title" {
    null = false
    type = text
  }
  primary_key {
    columns = [column.id]
  }
}
schema "public" {
}
