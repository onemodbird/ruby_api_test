class TranscriptSerializer < BaseSerializer
  attributes :id, :name, :begin_at_i, :end_at_i, :created_at_i, :chat, :user, :collection, :permissions

  def begin_at_i
    object.begin_at.to_i
  end

  def end_at_i
    object.end_at.to_i
  end

  def collection
    CollectionSimpleSerializer.serialize(object.collection) if object.collection
  end
end
