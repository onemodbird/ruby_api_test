class AddNameToTranscript < ActiveRecord::Migration
  def change
    add_column :transcripts, :name, :string
  end
end
