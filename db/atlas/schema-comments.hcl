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
table "comments" {
  schema = schema.public
  column "id" {
    null = false
    type = int
  }
  column "user" {
    null = false
    type = varchar(25)
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
  }
}
schema "public" {
}
