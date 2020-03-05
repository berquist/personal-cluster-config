function dump(o)
  -- Dump an object to its string representation.
  if type(o) == 'table' then
    local s = '{ '
    for k, v in pairs(o) do
      if type(k) ~= 'number' then k = '"'..k..'"' end
      s = s .. '['..k..'] = ' .. dump(v) .. ','
    end
    return s .. ' }'
  else
    return tostring(o)
  end
end

function split(str, pat)
  -- Split a string on a given pattern into a table as values. If the string
  -- ends in the pattern, don't add the empty string to the table.
  --
  -- str   : string to be split
  -- pat   : separator for split the string
  local t = {}  -- NOTE: use {n = 0} in Lua-5.0
  local last_end = 1
  if pat == '' then
    table.insert(t, str)
    return t
  end
  local s, e = str:find(pat, last_end)
  while s do
    if s ~= last_end then
      cap = str:sub(last_end, s - 1)
      table.insert(t, cap)
    else
      table.insert(t, '')
    end
    last_end = e+1

    s, e = str:find(pat, last_end)
  end
  if last_end <= #str then
    cap = str:sub(last_end)
    table.insert(t, cap)
  end
  return t
end

function table.contains(table, element)
  -- https://stackoverflow.com/q/2282444
  for _, value in pairs(table) do
    if value == element then
      return true
    end
  end
  return false
end

PROJECTS_TO_NON_PROJECT_PARTITIONS = {
  ["chemistry"] = {"infinite", "scavenge"},
  ["physics"] = {"scavenge"}
}

function slurm_job_submit(job_desc, part_list, submit_uid)
  local account = job_desc.account
  local requested_partitions = split(job_desc.partition, ',')
  local username = job_desc.user_name

  if account == nil then
    slurm.log_info("slurm_job_submit: no account specified by user %s", username)
    return slurm.ESLURM_INVALID_ACCOUNT
  elseif PROJECTS_TO_NON_PROJECT_PARTITIONS[account] == nil then
    slurm.log_info("slurm_job_submit: invalid account %s specified by user %s", account, username)
    return slurm.ESLURM_INVALID_ACCOUNT
  else
    local possible_non_project_partitions = PROJECTS_TO_NON_PROJECT_PARTITIONS[account]
    local restricted_partition = "infinite"
    if table.contains(requested_partitions, restricted_partition) == true then
      if table.contains(possible_non_project_partitions, restricted_partition) == false then
        slurm.log_info("slurm_job_submit: account %s cannot access the %s partition", account, restricted_partition)
        return slurm.ESLURM_ACCESS_DENIED
      end
    end
  end

  return slurm.SUCCESS
end

function slurm_job_modify(job_desc, job_rec, part_list, modify_uid)
  return slurm.SUCCESS
end

slurm.log_info("initialized")
return slurm.SUCCESS
