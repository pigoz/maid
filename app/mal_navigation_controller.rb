class MALNavigationController < UINavigationController
  attr_accessor :eventHandler

  def init
    super.tap {|nc|
      nc.navigationBar.setTintColor(RGBA.malBlue.uiColor)
    }
  end

  def handleEvent(symbol)
    eventHandler.call(symbol)
  end
end
