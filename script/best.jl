inputfolder = "doe/os/"
targetfolder = "best/os/"

files = 40:70
for k in files
    local foldername = "$(inputfolder)$(k)/6/16/weights/"
    fileslist = readdir(foldername)
    loss = zeros(length(fileslist))
    for (i,file) in enumerate(fileslist)
        loss[i] = parse(Float64,file[22:end])
    end     
    opt = argmin(loss)
    ifile = string(foldername,fileslist[opt])
    tfile = string(targetfolder,k)
    mv(ifile,tfile,force=true)
end 