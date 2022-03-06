class BackgroundSerializer

  def self.background(background, location)
    { "data":
     {
       "id": nil,
       "type": 'background',
       "attributes":
       {
         "image":
         {
           "location": location,
           "image_url": background[:photos][0][:url]
         },
         "credit":
         {
           "source": background[:photos][0][:photographer_url],
           "author": background[:photos][0][:photographer],
         }
       }
     }
   }
  end
end
