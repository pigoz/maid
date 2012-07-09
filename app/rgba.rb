class RGBA
  def initialize(r, g, b, a=255.0)
    @r, @g, @b, @a = [r, g, b, a].map(&:to_f)
  end

  def uiColor
    UIColor.colorWithRed(normalize(@r),
                  green: normalize(@g),
                   blue: normalize(@b),
                  alpha: normalize(@a))
  end

  def self.malBlue
    new(29, 67, 155)
  end

  def self.darkBlue
    new(8, 15, 35)
  end

  private
  def normalize(color)
    color / 255.0
  end
end
