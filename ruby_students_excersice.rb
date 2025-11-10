# Ruby excersice 

# Grades -> (A: 90-100, B: 80-89, C: 70-79, D: 60-69, F: 0-59)
# output -> { 
#  average: 74.3, 
#  grades: { "A" => 3, "B" => 2, "C" => 1, "D" => 1, "F" => 3 }, 
#  failing_students: ["Bob", "Eve", "Jack"], 
#  top_students: ["Ivy", "Alice", "Hank"] 
# }

students = [ { name: "Alice", score: 95 }, { name: "Bob", score: 58 }, 
{ name: "Charlie", score: 72 }, { name: "Daisy", score: 88 }, { name: "Eve", score: 40 }, 
{ name: "Frank", score: 65 }, { name: "Grace", score: 81 }, { name: "Hank", score: 90 }, 
{ name: "Ivy", score: 100 }, { name: "Jack", score: 54 } ]
    

def get_grade(score) 
  case score 
  when 90..100
    return "A"
  when 80..90
    return "B"
  when 70..79
    return "C"
  when 60..69
    return "D"
  when 0..59
    return "F"
  else
    return "invalid"
  end
end

total_score = 0
grades = {}
failing_students = []
approved_students = []

students.each do |student| 
  score = student[:score]
  total_score += score
  grade = get_grade(score)  
  grades[grade] = grades[grade] ? grades[grade] + 1 : 1  
  if score > 60
    approved_students << student
  else
    failing_students << student[:name]  
  end
end

output = {
  average: total_score/students.size.to_f, 
  grades: grades.sort_by {|key, val| key }.to_h, 
  failing_students: failing_students, 
  top_students: approved_students.sort_by {|student| student[:score] }.reverse.map {|student| student[:name] } [0..2]
}

puts output
