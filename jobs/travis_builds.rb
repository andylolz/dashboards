SCHEDULER.every '1m', :first_in => Time.now + 10 do

  send_event('travis-builds', TravisBuilds.update)
  send_event('travis-build-image', TravisBuilds.build_images)

end