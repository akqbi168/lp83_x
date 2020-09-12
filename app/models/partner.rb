class Partner < ApplicationRecord

  attachment :partner_image

  enum tag_id: {
    '1: ARTIST':1,
    '2: DJ':2,
    '3: ART':3,
    '4: PERFORMER':4,
    '5: TIE UP':5,
    '6: KITCHEN CAR':6,
    '7: others':7
  }

end
