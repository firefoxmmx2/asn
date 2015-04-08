/**
 * 
 */
package com.bornsoft.asn.utils.common;

import java.util.HashMap;
import java.util.Map;

import javax.script.Bindings;
import javax.script.Compilable;
import javax.script.CompiledScript;
import javax.script.ScriptContext;
import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;
import javax.script.ScriptException;
import javax.script.SimpleBindings;
import javax.script.SimpleScriptContext;

/**
 * Javascript evaluator
 * @author Ken Liu Kunyun
 *
 */
public class Javascript {
	private static ScriptEngineManager manager = new ScriptEngineManager();  // script engine
	private static ScriptEngine engine = manager.getEngineByName("javascript"); //javascript engine
	private static HashMap<String, CompiledScript> scripts=new HashMap<String, CompiledScript>();  // scripts
	
	private static CompiledScript compile(String src) throws ScriptException{
		CompiledScript ret=scripts.get(src);
		if(ret==null){
			ret=((Compilable)engine).compile(src);
		}
		return ret;
	}
	
	/**
	 * evaluate script
	 * @param src
	 * @param args
	 * @return
	 * @throws ScriptException
	 */
	public static Object eval(String src, Object ... args) throws ScriptException{
		Object ret=null;
		
		 // Here is where we store name/value pairs of parameters.
	    Map<String,Object> param = new HashMap<String,Object>();
	    for(int i=0; i<args.length/2; i++){
	    	param.put(args[i*2].toString(), args[i*2+1]);
	    }
	    
		// Use our own name/value pairs as JavaScript variables.
        Bindings bindings = new SimpleBindings(param);

		 // Create a context for evaluating scripts.
        ScriptContext context = new SimpleScriptContext();

        // Set those Bindings in the Context so that they are readable
        // by the scripts
        context.setBindings(bindings, ScriptContext.ENGINE_SCOPE);
        synchronized (engine) {
        	ret = compile(src).eval(context);
		}
		return ret;
	}
	
	/**
	 * evaluate script and get result as int
	 * @param src
	 * @param args
	 * @return
	 * @throws ScriptException
	 */
	public static int evalInt(String src, Object ... args) throws ScriptException{
		return new Float(evalFloat(src, args)).intValue();
	}
	
	/**
	 * evaluate script and get result as float
	 * @param src
	 * @param args
	 * @return
	 * @throws ScriptException
	 */
	public static float evalFloat(String src, Object ... args) throws ScriptException{
		return Float.parseFloat(eval(src, args).toString());
	}
	
	public static double evalDouble(String src, Object ... args) throws ScriptException{
		return Double.parseDouble(eval(src, args).toString());
	}
}
