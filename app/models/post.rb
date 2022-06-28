class Post < ActiveRecord::Base

    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: ["Fiction", "Non-Fiction"],
    message: "category is not a valid category" }
    validate :is_clickbate?



    # Finally, add a custom validator
    # to Post that ensures the title is 
    # sufficiently clickbait-y. 
    # If the title does not contain 
    #"Won't Believe", "Secret", 
    #"Top [number]", or "Guess", 
    #the validator should add a validation.
    # Use the Custom methods style of validator found in the Rails documentation.

    def is_clickbate?
        so = false
        arr = ["Won't Believe", "Secret", "Top [number]" "Guess",]
        arr.each do |t|
            if self.title != nil && self.title.include?(t)
                so = true
            end
        end
        if !so
            errors.add(:is_not_clickbate, "Must be clickbate")
        end
    end 

end
