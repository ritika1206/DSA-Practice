# https://leetcode.com/problems/accounts-merge/

def accounts_merge(accounts)
  emails_map = {}
  djs = DisJointSet.new
  ans = []
  accounts.each_with_index do |ac, i|
    ans[i] = [ac[0]]
    ac[1..].each do |email|
      if emails_map[email]
        djs.union(emails_map[email], i)
      else
        emails_map[email] = i
        ans[i] << email
      end
    end
  end
  emails_map.each do |email, node|
    pn = djs.find_parent(node)
    ans[pn] << email
    ans[node] = nil if pn != node
  end
  ans
end


class DisJointSet
  attr_reader :size, :parent

  def initialize
    @size = Hash.new(1)
    @parent = Hash.new { |h, k| h[k] = k }
  end

  def find_parent(node)
    return node if node == parent[node]

    parent[node] = find_parent(parent[node])
  end

  def union(u, v)
    # find ultimate parent of u and v
    pu = find_parent(u)
    pv = find_parent(v)

    if size[pu] < size[pv]
      size[pv] += size[pu]
      parent[pu] = pv
    else
      size[pu] += size[pv]
      parent[pv] = pu
    end
  end
end
