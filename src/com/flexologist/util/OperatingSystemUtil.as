/**
 * Created by IntelliJ IDEA.
 * User: danny
 * Date: 2011/01/17
 * Time: 1:26 AM
 * To change this template use File | Settings | File Templates.
 */
package com.flexologist.util
{
    import flash.system.Capabilities;

    /**
     * Thanks to Jonnie for this!
     * https://github.com/destroytoday/destroy-desktop-core/blob/master/src/com/destroytoday/model/OperatingSystemModel.as
     *
     */
    public class OperatingSystemUtil
    {
        public static const MAC:String = "mac";
        public static const WINDOWS:String = "windows";
        public static const LINUX:String = "linux";

        public function OperatingSystemUtil()
        {
        }

        public static function get osType():String
        {
            var os:String = Capabilities.os.toLowerCase();
            var type:String;

            if (os.indexOf('mac os') != -1)
            {
                type = MAC;
            }
            else if (os.indexOf('windows') != -1)
            {
                type = WINDOWS;
            }
            else if (os.indexOf('linux') != -1)
            {
                type = LINUX;
            }

            return type;
        }
    }
}