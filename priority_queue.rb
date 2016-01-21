# Copyright (c) 2016 Adam Ritter
# License: MIT License

class PriorityQueue
  def initialize
    @a=[]
  end
  def up(i)
    return if i==0
    i2=i/2
    if @a[i]<@a[i2]
      lastai=@a[i]
      @a[i]=@a[i2]
      @a[i2]=lastai
      up(i2)
    end
  end
  def <<(other)
    @a << other
    up(@a.size-1)
  end
  def top
    @a.first
  end
  def empty?
    @a.empty?
  end
  def down(i)
    mini=i
    if @a.size>i*2 and @a[i*2]>@a[mini]
      mini=i*2
    end
    if @a.size>i*2+1 and @a[i*2+1]>@a[mini]
      mini=i*2+1
    end
    if mini>i
      lastai=@a[i]
      @a[i]=@a[mini]
      @a[mini]=lastai
      down(mini)
    end
  end
  def pop
    return if empty?
    return @a.pop if @a.size==1
    r=@a.first
    @a[0]=@a.pop
    down(0)
    r
  end
  def push(other)
    self << other
  end
end


pq=PriorityQueue.new
p pq.pop # nil
pq << 3
p pq.top # 3
p pq.empty? # false
p pq.pop # 3
p pq.empty? # true
pq.push 5
pq << 4
pq << 6
p pq.top # 4
