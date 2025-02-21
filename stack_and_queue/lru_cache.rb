# https://leetcode.com/problems/lru-cache/

class LRUCache

  # =begin
      # :type capacity: Integer
  # =end
      def initialize(capacity)
          @c = capacity
          @h = {}
          @head = nil
          @tail = nil
          @size = 0
      end
  
  
  # =begin
      # :type key: Integer
      # :rtype: Integer
  # =end
      def get(key)
          if @h[key]
              move_to_front(@h[key])
              @h[key].val
          else
              -1
          end
      end
  
  # =begin
      # :type key: Integer
      # :type value: Integer
      # :rtype: Void
  # =end
      def put(key, value)
          if @h[key]
              @h[key].val = value
              move_to_front(@h[key])
          else
              node = Node.new(value, @head, nil, key)
              @head.prev = node if @head
              @head = node
              @tail ||= node
              @h[key] = node
              @size += 1
          end
  
          if @size > @c
              evict_last
          end
      end
  
      private
  
      def move_to_front(node)
          return if @head == node
  
          node.prev.next = node.next
          if node.next
              node.next.prev = node.prev
          else
              @tail = node.prev
          end
          node.next = @head
          node.prev = nil
          @head.prev = node
          @head = node
      end
  
      def evict_last
          @tail.prev.next = nil
          prev = @tail.prev
          @tail.prev = nil
          @h.delete(@tail.key)
          @tail = prev
          @size -= 1
      end
  end
  
  class Node
      attr_accessor :next, :prev, :key, :val
  
      def initialize(value, next_node, prev_node, key)
          @val = value
          @next = next_node
          @prev = prev_node
          @key = key
      end
  end
  
  # Your LRUCache object will be instantiated and called as such:
  # obj = LRUCache.new(capacity)
  # param_1 = obj.get(key)
  # obj.put(key, value)
