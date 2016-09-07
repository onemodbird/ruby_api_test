class CollectionWithTranscriptSerializer < CollectionSerializer
  attributes :transcript

  def transcript
    return nil unless object.transcript
    {
      id: object.transcript.id,
      begin_at: object.transcript.begin_at,
      chat: { name: object.transcript.chat.name },
      name: object.transcript.name
    }
  end
end
