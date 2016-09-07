class ChangeResourceKindToString < ActiveRecord::Migration
  def up
    execute(%(
      ALTER TABLE resources
      ALTER COLUMN kind DROP DEFAULT,
      ALTER COLUMN kind SET DATA TYPE varchar
    ))
    execute(%(
      DROP TYPE resources_kind
    ))
  end

  def down
    execute(%(
      CREATE TYPE resources_kind
      AS ENUM ( 'undefined',
                'app',
                'video',
                'webpage',
                'video_channel',
                'file',
                'ibook' )
    ))
    execute(%(
      ALTER TABLE resources
      ALTER COLUMN kind DROP DEFAULT,
      ALTER COLUMN kind SET DATA TYPE resources_kind
        USING CAST(
          CASE kind
            WHEN 'undefined' THEN 'undefined'
            WHEN 'app' THEN 'app'
            WHEN 'video' THEN 'video'
            WHEN 'webpage' THEN 'webpage'
            WHEN 'video_channel' THEN 'video_channel'
            WHEN 'file' THEN 'file'
            WHEN 'ibook' THEN 'ibook'
          END
          AS resources_kind
        ),
      ALTER COLUMN kind SET DEFAULT 'undefined'
    ))
  end
end
