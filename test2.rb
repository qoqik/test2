currentnum = 1
turn = 1
semaphore = Mutex.new

t1 = Thread.new do
  while currentnum <= 10
    semaphore.synchronize {
      if turn == 1
        puts "Thread 1 : #{currentnum}"
        currentnum += 1
        turn = 2
      end
    }
    Thread.pass
  end
end

t2 = Thread.new do
  while currentnum <= 10
    semaphore.synchronize {
      if turn == 2
        puts "Thread 2 : #{currentnum}"
        currentnum += 1
        turn = 1
      end
    }
    Thread.pass
  end
end

t1.join
t2.join
