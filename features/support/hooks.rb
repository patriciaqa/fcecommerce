Before do
    page.current_window.resize_to(1536, 864)
  end


  Before ("@autenticado") do
    visit("/pt-br")
    find("[mh-sign-in-label = Login]").click
    find('a[class$=sign-in-btn]', text: "Login", visible: false).click
    find("#EmailAddress").set "testautomationfcamara@gmail.com"
    find("#Password").set "Fcamara2020"
    find("#sign-in-button").click
    sleep 10
  end

# After("@deslogar") do

# end

# After do |scenario|
#     temp_shot = page.save_screenshot("logs/temp_shot.png")
#     screenshot = Base64.encode64(File.open(temp_shot, "rb").read)
#     embed(screenshot, "image/png", "Screenshot")
# end

# Before ("@limpacarrinho") do

# end 

After do |scenario|
  nome = scenario.name.tr(' ', '_').downcase!
  nome = nome.gsub(/([_@#!%()\-=;><,{}\~\[\]\.\/\?\"\*\^\$\+\-]+)/,'')
  print = "log/screenshots/#{nome}.png"
  page.save_screenshot(print)
  embed(print, 'image/png', 'Clique aqui para ver as evidências')
end