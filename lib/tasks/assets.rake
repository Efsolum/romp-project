namespace :assets do
  desc "Compile sass files"
  task sass: :environment do
    sh "gulp clean:assets:css"
    sh "gulp development:compile:css"
  end

  desc "Process/Generate fonts from ttf/otf"
  task fonts: :environment do
    sh "gulp clean:assets:fonts"
    sh "gulp development:process:fonts"
  end

  desc "Compile Javascript"
  task javascript: :environment do
    sh "gulp clean:assets:javascript"
    sh "gulp development:compile:javascript"
  end

  desc "Process images"
  task images: :environment do
    sh "gulp clean:assets:images"
    sh "gulp development:process:images"
  end

  desc "Process icons"
  task icons: :environment do
    sh "gulp clean:assets:icons"
    sh "gulp development:process:icons"
  end

end
