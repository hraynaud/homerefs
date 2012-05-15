class ReviewObserver < ActiveRecord::Observer

  def after_save(review)
    bldg = review.building

    if bldg.score.nil? or bldg.score==0
      bldg.score = review.score
    else
      total = bldg.score * (bldg.reviews_count-1)
      total += review.score
      bldg.score = total/bldg.reviews_count
      bldg.save
    end

  end

end
