package etec.com.br;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.text.Editable;
import android.text.TextWatcher;
import android.text.method.HideReturnsTransformationMethod;
import android.text.method.PasswordTransformationMethod;
import android.view.View;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.CompoundButton;
import android.widget.EditText;
import android.widget.ImageButton;
import android.widget.ImageView;

import com.synnapps.carouselview.CarouselView;
import com.synnapps.carouselview.ImageListener;

public class TelaCadastro extends AppCompatActivity {
    private ImageButton MostrarPASS;
    private Button Avancar;
    EditText Nome;
    EditText Email;
    EditText Senha;
    EditText DataNasc;
    CheckBox checkShowPass;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_tela_cadastro);

        Senha = findViewById(R.id.editSenha);
        checkShowPass = findViewById(R.id.checkShowPass);

        checkShowPass.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {
            @Override
            public void onCheckedChanged(CompoundButton compoundButton, boolean b) {
                if (b) {
                    checkShowPass.setTransformationMethod(HideReturnsTransformationMethod.getInstance());
                } else {
                    checkShowPass.setTransformationMethod(PasswordTransformationMethod.getInstance());
                }
            }
        });
    }



}
