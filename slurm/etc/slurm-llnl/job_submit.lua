--[[
--]]

function slurm_job_submit(job_desc, part_list, submit_uid)
  return slurm.SUCCESS
end

function slurm_job_modify(job_desc, job_rec, part_list, modify_uid)
  if job_desc.comment == nil then
    local comment = "***TEST_COMMENT***"
    slurm.log_info("slurm_job_modify: for job %u from uid %u, setting default comment value: %s",
                   job_rec.job_id, modify_uid, comment)
    job_desc.comment = comment
  end

  return slurm.SUCCESS
end

slurm.log_info("initialized")
return slurm.SUCCESS
