for i, scripts in ipairs(directoryFileList('contents/funkin-vslice/globally/data/scripts/utils/')) do
    require('contents/funkin-vslice/globally/data/scripts/utils/'..string.gsub(scripts, '.lua', '')) -- Shiho made this tysm
end
