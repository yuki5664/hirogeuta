User.create!(name:  "Example User",
              email: "example@railstutorial.org",
              password:              "foobar",
              password_confirmation: "foobar",
              activated: true,
              activated_at: Time.zone.now)

User.create!(name:  "Example User2",
              email: "example2@railstutorial.org",
              password:              "foobar",
              password_confirmation: "foobar",
              activated: true,
              activated_at: Time.zone.now)

User.create!(name:  "採用 太郎",
              email: "saiyou@railstutorial.org",
              password:              "password",
              password_confirmation: "password",
              activated: true,
              activated_at: Time.zone.now)