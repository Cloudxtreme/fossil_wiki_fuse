require 'open3'
CMD="fossil wiki "
class FossilWikiFuse
  def contents path
    `#{CMD} list`.split "\n"
  end
  def file? path
      contents(nil).include?("#{path[1..-1]}")
  end
  def read_file path
     `#{CMD} export "#{path[1..-1]}"`
  end
  def size path
      read_file(path).size
  end
  def can_write? path
      true
  end
  def write_to path, body
      action = ((file?(path))?"commit":"create")
      Open3.popen3("#{CMD}#{action} \"#{path[1..-1]}\"") do |stdin, stdout, stderr|
          stdin.puts body
      end
  end
  def can_delete? path
     `#{CMD} delete page "#{path[1..-1]}"`
  end
  def delete path
      true
  end
  def touch(path, body)
      write_to path, body
  end
end
