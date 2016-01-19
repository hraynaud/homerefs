class ReviewObserver < ActiveRecord::Observer

  def after_create(review)
    calc_summary(review)
  end


  def after_update(review)
    #re_calc_summary(review)
  end


  private

  attr_accessor :review, :bldg, :num_reviews

  def calc_summary(rev)
   setup(rev)
   calc_score
   calc_avg_rent
   bldg.save
  end

  def re_calc_summary(rev)
   setup(rev)
   re_calc_score
   re_calc_avg_rent
   bldg.save
  end

  def calc_score()
    calc_for_new_review(review.score, "score")
  end

  def calc_avg_rent()
    calc_for_new_review(review.monthly_fee, "reviewer_avg_rent")
  end

  def recalc_score()
    if bldg.score==0.0 or num_reviews ==1
      bldg.score = review.score
    else
      total = bldg.score * (num_reviews-1)
      total += review.score
      bldg.score = total/num_reviews
    end
  end


  def calc_for_new_review amt, type
    if amt==0.0 or num_reviews ==1
      bldg.send("#{type}=", amount)
    else
      return if  amt.nil?
      total = bldg.send("#{type}") * (num_reviews-1)
      total += amt 
      bldg.send("#{type}=", total/num_reviews)
    end
  end

  def re_calc_avg_rent()
    bldg.reset_reviewer_avg_rent
  end

  def setup(rev)
    @review = rev
    @bldg = review.building.reload
    @num_reviews =  bldg.reviews.rent_included.count
  end

end
