/**
 * Created by IntelliJ IDEA.
 * User: danny
 * Date: 2011/01/17
 * Time: 2:08 AM
 * To change this template use File | Settings | File Templates.
 */
package com.flexologist.util
{
    import flash.filesystem.File;
    import flash.filesystem.FileMode;
    import flash.filesystem.FileStream;

    public class HostsFileUtil
    {
        public function HostsFileUtil()
        {
        }

        public static function getHostAddresses(file:File):Array
        {
            if(!file.exists)
                return [];

            var contents:String = readFile(file);
            var lines:Array = contents.split("\n");

            var hosts:Array = [];
            for each(var line:String in lines)
            {
                // cleans leading and trailing whitespace
                line = line.replace(/^[ \t]+|[ \t]+$/, "");

                var parts:Array = line.split(/\s/);

                // if the first part is a #, the line is commented out and can be skipped
                if(parts[0] == "#")
                    continue;

                // if either of the parts are empty, skip them
                if(parts[0].length == 0 || parts[1].length == 0)
                    continue;

                hosts.push({address:parts[0], hostname:parts[1]});
            }

            for each(var host:Object in  hosts)
                trace(host.address + "\t" + host.hostname);

            return null;
        }

        private static function readFile(file:File):String
        {
            var instream:FileStream = new FileStream();
            instream.open(file, FileMode.READ);
            return instream.readUTFBytes(instream.bytesAvailable);
        }
    }
}
