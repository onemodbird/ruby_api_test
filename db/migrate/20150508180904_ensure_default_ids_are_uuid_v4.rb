class EnsureDefaultIdsAreUuidV4 < ActiveRecord::Migration
  def change
    reversible do |migrating|
      migrating.up do
        execute(%(
          ALTER TABLE resources ALTER COLUMN id SET DEFAULT uuid_generate_v4()
        ))
        execute(%(
          ALTER TABLE reviews ALTER COLUMN id SET DEFAULT uuid_generate_v4()
        ))
        execute(%(
          ALTER TABLE tag_groups ALTER COLUMN id SET DEFAULT uuid_generate_v4()
        ))
        execute(%(
          ALTER TABLE users ALTER COLUMN id SET DEFAULT uuid_generate_v4()
        ))
      end

      migrating.down do
        execute(%(
          ALTER TABLE resources ALTER COLUMN id SET DEFAULT uuid_generate_v1()
        ))
        execute(%(
          ALTER TABLE reviews ALTER COLUMN id SET DEFAULT uuid_generate_v1()
        ))
        execute(%(
          ALTER TABLE tag_groups ALTER COLUMN id SET DEFAULT uuid_generate_v1()
        ))
        execute(%(
          ALTER TABLE users ALTER COLUMN id SET DEFAULT uuid_generate_v1()
        ))
      end
    end
  end
end
