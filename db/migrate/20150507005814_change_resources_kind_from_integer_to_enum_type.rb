class ChangeResourcesKindFromIntegerToEnumType < ActiveRecord::Migration
  def change
    reversible do |migrating|
      migrating.up do
        execute(%(
          CREATE TYPE resources_kind
          AS ENUM ( 'undefined',
                    'app',
                    'video',
                    'webpage',
                    'video_channel',
                    'file' )
        ))
        execute(%(
          ALTER TABLE resources
          ALTER COLUMN kind DROP DEFAULT,
          ALTER COLUMN kind SET DATA TYPE resources_kind
            USING CAST(
              CASE kind
                WHEN 0 THEN 'undefined'
                WHEN 1 THEN 'app'
                WHEN 2 THEN 'video'
                WHEN 3 THEN 'webpage'
                WHEN 4 THEN 'video_channel'
                WHEN 5 THEN 'file'
              END
              AS resources_kind
            ),
          ALTER COLUMN kind SET DEFAULT 'undefined'
        ))
      end

      migrating.down do
        execute(%(
          ALTER TABLE resources
          ALTER COLUMN kind DROP DEFAULT,
          ALTER COLUMN kind SET DATA TYPE integer
            USING (
              CASE kind
                WHEN 'undefined' THEN 0
                WHEN 'app' THEN 1
                WHEN 'video' THEN 2
                WHEN 'webpage' THEN 3
                WHEN 'video_channel' THEN 4
                WHEN 'file' THEN 5
              END
            ),
          ALTER COLUMN kind SET DEFAULT 0
        ))
        execute(%(
          DROP TYPE resources_kind
        ))
      end
    end

  end
end
