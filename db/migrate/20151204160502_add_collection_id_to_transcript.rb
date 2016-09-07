class AddCollectionIdToTranscript < ActiveRecord::Migration
  def change
    add_column :transcripts, :collection_id, :string
    add_index :transcripts, :collection_id
  end
end
