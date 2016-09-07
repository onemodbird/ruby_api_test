module Appo
module Transactors
class ReviewDestroyer

  def initialize resource, review
    @resource = resource
    @review = review
  end

  def destroy!
    resource_review =
      @resource.reviews.reject!{|r| r.fetch('id') == @review.id }

    if resource_review
      @resource.transaction do
        @review.destroy!
        @resource.save!
      end
    else
      raise "ReviewDeletionDiscrepancy for review ID: #{params[:id]}"
    end
  end

end
end
end
