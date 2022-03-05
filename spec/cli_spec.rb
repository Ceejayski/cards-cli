# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength

RSpec.describe "CardsMagic CLI" do 
  it "supports the --help flag" do
    command = "./exe/cards --help"
    expect { system(command) }
      .to output(a_string_including("Fetch data from the magicthegathering API"))
      .to_stdout_from_any_process

    expect { system(command) }
      .to_not output
      .to_stderr_from_any_process
  end
  it "support grouping data by set" do
    command = "./exe/cards --groupby-set"
    expect { system(command) }
      .to_not output([])
      .to_stdout_from_any_process
    expect { system(command) }
      .to_not output
      .to_stderr_from_any_process
  end

  it "support grouping data by set and rarity" do
    command = "./exe/cards --groupby-set-rarity"
    expect { system(command) }
      .to_not output([])
      .to_stdout_from_any_process
    expect { system(command) }
      .to_not output
      .to_stderr_from_any_process
      
  end

  it "support get list of cards with KTK as set and colrs red & blue" do
    command = "./exe/cards -k"
    expect { system(command) }
      .to_not output([])
      .to_stdout_from_any_process
    expect { system(command) }
      .to_not output
      .to_stderr_from_any_process
      
  end
end
