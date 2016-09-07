module Appo
module Transactors
class CreateReview

  def initialize(resource, review)
    @resource = resource
    @review = review
    @created = false
  end

  def create
    if @review.valid?
      @resource.transaction do
        @review.save!
        @resource.reviews.push @review.attributes
        @resource.save!
        @created = true
      end
    end
    @created
  end

end
end
end
