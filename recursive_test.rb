
require 'yaml'
files = [
  'images/animal/dog.jpg',
  'images/animal/jungle/tiger.doc',
  'documents/presentation/presentatio.doc',
  'documents/presentation/2025/presentatio.doc'

]
def insert(hash, path, value)
  head, *tail = path

  if tail.empty?
    hash.merge(head => value)
  else
    new_hash = hash[head].is_a?(Hash) ? hash[head] : {}
    h = insert(new_hash, tail, value)

    hash.merge(head => hash.has_key?(head) ? new_hash.merge(h) : h)
  end
end

y_hash = {}
total = []
files.each do |file|
  filename = File.basename(file)
  path  = File.dirname(file)
  y_hash = insert(y_hash, path.split('/'), filename)


end

puts y_hash.to_yaml
