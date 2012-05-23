class ReviewObserver < ActiveRecord::Observer

  def after_create(review)
    bldg = review.building.reload

    num_reviews =  bldg.reviews_count
    if bldg.score==0.0 or num_reviews ==1
      bldg.score = review.score
    else
      total = bldg.score * (num_reviews-1)
      total += review.score
      bldg.score = total/num_reviews
    end

      bldg.save
  end

end
