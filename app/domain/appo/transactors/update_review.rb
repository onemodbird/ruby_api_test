module Appo
module Transactors
class UpdateReview

  def initialize(resource, review)
    @resource = resource
    @review = review
    @updated = false
  end

  def update
    if @review.valid?
      @resource.transaction do
        @review.save!
        @resource.reviews.delete_if{ |r|
          r.fetch('id') == @review.id
        }.push(@review.attributes)
        @resource.save!
        @updated = true
      end
    end
    @updated
  end

end
end
end
