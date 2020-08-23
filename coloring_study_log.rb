def update_logs(input_subject, input_minutes,study_logs)
  input_subject.downcase!
  if study_logs.has_key?(input_subject)
    study_logs[input_subject] += input_minutes
  else
    study_logs[input_subject] = input_minutes
  end
end

def print_logs(study_logs)
  study_logs.each{|subject,minutes|
    coloring_blocks = ""
    (minutes/15).times {
      coloring_blocks << "■"
    }

    puts "＊＊＊＊学習記録＊＊＊＊"
    puts "#{subject} #{coloring_blocks}"
    puts "＊＊＊＊＊＊＊＊＊＊＊＊＊＊"
  }
end

def main_proc
  study_logs = {}
  while true do
    # 変数の初期化
    input_subject = nil
    input_minutes = nil
    puts "※ 入力を終了する場合はexitと入力してください。"
    puts "学習項目を入力："
    input_subject = gets.chomp
    return if input_subject=="exit"
    puts "学習時間を入力（単位：分）："
    input_minutes = gets.to_i
    return if input_minutes=="exit"

    update_logs(input_subject,input_minutes,study_logs)
    print_logs(study_logs)

  end
end

main_proc
