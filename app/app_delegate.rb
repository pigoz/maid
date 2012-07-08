class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.backgroundColor = UIColor.whiteColor
    @window.rootViewController = LauncherFactory.launcher_view_controller
    @window.makeKeyAndVisible
    true
  end
end
